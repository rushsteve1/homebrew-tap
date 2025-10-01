cask "okular@nightly" do
  arch arm: "arm64"

  version "6766"
  sha256 "0e1d26c316a72f09ed6fafdf9087a6006663422d770c50246bc06468bb75ce7e"

  url "https://cdn.kde.org/ci-builds/graphics/okular/master/macos-#{arch}/okular-master-#{version}-macos-clang-#{arch}.dmg"
  name "Okular"
  desc "Universal Document Viewer"
  homepage "https://okular.kde.org/"

  livecheck do
    url "https://cdn.kde.org/ci-builds/graphics/okular/master/macos-#{arch}/"
    regex(/href=["']okular-master-(\d+)-macos-clang-#{arch}\.dmg["' >]/i)
  end

  depends_on macos: ">= :monterey"

  app "okular.app", target: "Okular.app"

  zap trash: ""
end
