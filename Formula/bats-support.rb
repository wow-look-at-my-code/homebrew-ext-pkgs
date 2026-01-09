# typed: false
# frozen_string_literal: true

class BatsSupport < Formula
  desc "Supporting library for Bats (Bash Automated Testing System)"
  homepage "https://github.com/bats-core/bats-support"
  url "https://github.com/bats-core/bats-support/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "7815237aafeb42ddcc1b8c698fc5808026d33317d8701d5ec2396e9634e2918f"
  license "CC0-1.0"

  def install
    (lib/"bats-support").install Dir["*"]
  end

  def caveats
    <<~EOS
      To use bats-support, set BATS_LIB_PATH:
        export BATS_LIB_PATH="#{HOMEBREW_PREFIX}/lib"

      Then in your test files:
        bats_load_library bats-support
    EOS
  end

  test do
    assert_predicate lib/"bats-support/load.bash", :exist?
  end
end
