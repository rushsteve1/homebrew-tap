# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class TrashD < Formula
  desc "Near drop-in replacement for rm that uses the trash bin. Written in D"
  homepage "https://github.com/rushsteve1/trash-d"
  url "https://github.com/rushsteve1/trash-d/archive/refs/tags/20.tar.gz"
  sha256 "d77132ff98a233d264c984db601446a52364c60b0973b04b99bf0ec1afe87826"
  license "MIT"

  livecheck do
    url :url
    strategy :git
  end

  depends_on "dub" => :build
  depends_on "ldc" => :build
  depends_on "scdoc" => :build

  def install
    # Remove unrecognized options if they cause configure to fail
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    system "dub build --build=release && strip build/trash"
    bin.install "build/trash"
    system "scdoc < MANUAL.scd > build/trash.1"
    man.install "build/trash.1"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test trash-d`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    assert_match(/trash-d version #{version}/, shell_output("#{bin}/trash --version"))
    assert_path_exists "#{man1}/trash.1"
  end
end
