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
    system "dub build --build=release && strip build/trash"
    bin.install "build/trash"
    system "scdoc < MANUAL.scd > build/trash.1"
    man.install "build/trash.1"
  end

  test do
    assert_match(/trash-d version #{version}/, shell_output("#{bin}/trash --version"))
    assert_path_exists "#{man1}/trash.1"
  end
end
