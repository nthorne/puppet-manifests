#!/bin/bash -

# vim: filetype=sh

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



function usage()
{
  cat <<Usage_Heredoc
Usage: $(basename "$0") [OPTIONS] [PROJECT]

Create a default sbt project, where Project is the project name.

Where valid OPTIONS are:
  -h, --help  display usage

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
      *)
        if [[ -z $PROJECT ]]
        then
          PROJECT=$1
        else
          error "Unknown option: $1. Try $(basename $0) -h for options."
        fi
        ;;
    esac

    shift
  done

  [[ -d $PROJECT || -z $PROJECT ]] && error "$PROJECT: invalid project."
}

function make_project()
{
  mkdir "$PROJECT"
  cd "$PROJECT" || error "$PROJECT: unable to enter."
  mkdir -p src/{main,test}/{java,resources,scala}
  mkdir lib project target

  # create an initial build.sbt file
cat > build.sbt << SbtHeredoc
name := "$PROJECT"
version := "1.0"
scalaVersion := "2.11.8"

libraryDependencies += "org.scalactic" %% "scalactic" % "2.2.6"
libraryDependencies += "org.scalatest" %% "scalatest" % "2.2.6" % "test"
SbtHeredoc

TESTSPEC=$PROJECT"Spec"
cat > src/test/scala/$PROJECT.scala << TestHereDoc
// create an initial test
import org.scalatest._
import $PROJECT._

class $TESTSPEC extends FlatSpec with Matchers {

  "foo" should "bar" in {
    foo.foo() should be (List())
  }
}
TestHereDoc

cat > src/main/scala/$PROJECT.scala << SrcHeredoc
package $PROJECT

object $PROJECT {
  def foo() = List()
}

SrcHeredoc
}

parse_options "$@"
make_project
