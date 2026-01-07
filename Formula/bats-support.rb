# typed: false
# frozen_string_literal: true

class BatsSupport < Formula
  desc "Supporting library for Bats (Bash Automated Testing System)"
  homepage "https://github.com/bats-core/bats-support"
  url "https://github.com/bats-core/bats-support/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "7815237aafeb42ddcc1b8c698fc5808026d33317d8701d5ec2396e9634e2918f"
  license "CC0-1.0"

  def install
    prefix.install Dir["*"]
  end

  test do
    assert_predicate prefix/"load.bash", :exist?
  end
end
