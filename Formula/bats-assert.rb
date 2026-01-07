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
    prefix.install Dir["*"]
  end

  def caveats
    <<~EOS
      Add to your test files:
        load "#{opt_prefix}/load.bash"
    EOS
  end

  test do
    assert_predicate prefix/"load.bash", :exist?
  end
end
