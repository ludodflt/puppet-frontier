#!/usr/bin/ruby
require 'facter'
if Facter.value(:os)['family'] == 'RedHat'
    version = Facter::Util::Resolution.exec("rpm -q frontier-squid --queryformat '[%{NAME} %{VERSION}-%{RELEASE}\n]'")

    Facter.add("#{version.split[0]}".gsub('-','_')) do
        setcode do
            "#{version.split[1]}"
        end
    end
end