# typed: false
# frozen_string_literal: true

class BatsAssert < Formula
  desc "Common assertions for Bats (Bash Automated Testing System)"
  homepage "https://github.com/bats-core/bats-assert"
  url "https://github.com/bats-core/bats-assert/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "98ca3b685f8b8993e48ec057565e6e2abcc541034ed5b0e81f191505682037fd"
  license "CC0-1.0"

  depends_on "bats-core"
  depends_on "bats-support"

  def install
    (lib/"bats-assert").install Dir["*"]
  end

  def caveats
    <<~EOS
      To use bats-assert, set BATS_LIB_PATH:
        export BATS_LIB_PATH="#{HOMEBREW_PREFIX}/lib"

      Then in your test files:
        bats_load_library bats-support
        bats_load_library bats-assert
    EOS
  end

  test do
    assert_predicate lib/"bats-assert/load.bash", :exist?
  end
end
