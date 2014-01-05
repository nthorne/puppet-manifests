#!/bin/bash

if [[ ! -f $1/files/generated/bankid.tar.gz ]]
then
  wget --no-check-certificate -O $1/files/generated/bankid.tar.gz "https://install.bankid.com/Download?defaultFileId=Linux"
  tar xf $1/files/generated/bankid.tar.gz -C $1/files/generated

  cat > $1/manifests/generated/bankid.pp << HEREDOC
class target-slaptopen::generated::bankid {
  exec {"install-bankid":
    cwd => "\${target}/files/generated/$(cd $1/files/generated; ls -d BISP-*)",
    command => "bash $(cd $1/files/generated/BISP-*; ls install.*.sh) i",
    creates => "/usr/local/lib/personal",
    path => ["/bin", "/sbin", "/usr/bin", "/usr/sbin"],
    user => "root",
    group => "root",
    logoutput => true,
  }
}
HEREDOC
fi
