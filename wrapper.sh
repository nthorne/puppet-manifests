#!/bin/bash -

# vim: filetype=sh

####################################################################
# Changelog:
#
# Todo:
#   *) Change default values
#
# Notes: 
#   As the PATH is set to a saner (reduced) value, some filters
#   and tools might not be located as expected; if this is the case,
#   prefer naming the tool with full path e.g. '/usr/bin/tar' rather
#   than 'tar'.
####################################################################

# Set IFS explicitly to space-tab-newline to avoid tampering
IFS=' 	
'

# If found, use getconf to constructing a reasonable PATH, otherwise
# we set it manually.
if [[ -x /usr/bin/getconf ]]
then
  PATH=$(/usr/bin/getconf PATH)
else
  PATH=/bin:/usr/bin:/usr/local/bin
fi

# Global variables
FLAGS=



function usage()
{
  cat <<Usage_Heredoc
Usage: $(basename $0) [OPTIONS] [TARGET]

This is a default template for shell scripts.

Where valid OPTIONS are:
  --debug     perform a dry run
  -h, --help  display usage
  -l, --list  list available TARGETs

Usage_Heredoc
}

function error()
{
  echo "Error: $@" >&2
  exit 1
}

function parse_options()
{
  while (($#))
  do
    case $1 in
      -h|--help)
        usage
        exit 0
        ;;
      --debug)
        FLAGS=--noop
        ;;
      -l|--list)
        list_targets
        exit 0
        ;;
      *)
        if [[ -z $TARGET ]]
        then
          TARGET=$1
        else
          error "$1: unknown option."
        fi
        ;;
    esac

    shift
  done

  if [[ -z TARGET ]]
  then
    error "TARGET not specified."
  else
    if [[ ! -d target-$TARGET ]]
    then
      error "$TARGET: invalid target. Try $0 -l"
    else 
      TARGET=target-$TARGET
    fi
  fi
}

function list_targets()
{
  echo "Available targets:"
  ls -d target-* 2>/dev/null | sed -e 's/target-/  /g'
}

function run_generators()
{
  mkdir -p $TARGET/manifests/generated
  mkdir -p $TARGET/files/generated

  for SCRIPT in $(ls $TARGET/generators 2>/dev/null);
  do
    echo "Running generator $SCRIPT"
    $TARGET/generators/$SCRIPT
  done
}

function apply_manifests()
{
  sudo FACTER_user=$USER FACTER_group=$GROUPS FACTER_home=$HOME puppet apply $FLAGS --verbose --modulepath=$(pwd) -e "include $TARGET"
}

parse_options "$@"
run_generators 
apply_manifests
