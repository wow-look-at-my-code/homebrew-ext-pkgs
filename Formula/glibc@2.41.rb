# typed: false
# frozen_string_literal: true

class GlibcAT241 < Formula
  desc "GNU C Library"
  homepage "https://www.gnu.org/software/libc/"
  url "https://ftp.gnu.org/gnu/glibc/glibc-2.41.tar.xz"
  sha256 "a5a26b22f545d6b7d7b3dd828e11e428f24f4fac43c934fb071b6a7d0828e901"
  license "LGPL-2.1-or-later"

  depends_on "bison" => :build
  depends_on "gawk" => :build
  depends_on "linux-headers@5.15" => :build
  depends_on "make" => :build
  depends_on "python@3" => :build
  depends_on :linux

  def install
    mkdir "build" do
      args = %W[
        --disable-debug
        --disable-dependency-tracking
        --disable-silent-rules
        --prefix=#{prefix}
        --enable-kernel=4.4.0
        --disable-werror
        --enable-stack-protector=strong
        --with-headers=#{Formula["linux-headers@5.15"].include}
        --disable-nscd
      ]

      system "../configure", *args
      system "make"
      system "make", "install"
    end
  end

  test do
    (testpath/"test.c").write <<~C
      #include <stdio.h>
      int main() {
        printf("Hello, glibc!\\n");
        return 0;
      }
    C
    system ENV.cc, "test.c", "-o", "test"
    assert_equal "Hello, glibc!\n", shell_output("./test")
  end
end
