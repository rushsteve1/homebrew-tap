# Documentation: https://docs.brew.sh/Cask-Cookbook
#                https://docs.brew.sh/Adding-Software-to-Homebrew#cask-stanzas
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
cask "okular@nightly" do
  version "6766"
  arch arm: "arm64"
  sha256 "0e1d26c316a72f09ed6fafdf9087a6006663422d770c50246bc06468bb75ce7e"

  url "https://cdn.kde.org/ci-builds/graphics/okular/master/macos-#{arch}/okular-master-#{version}-macos-clang-#{arch}.dmg"
  name "Okular"
  desc "The Universal Document Viewer"
  homepage "https://okular.kde.org"

  # Documentation: https://docs.brew.sh/Brew-Livecheck
  livecheck do
    url "https://cdn.kde.org/ci-builds/graphics/okular/master/macos-#{arch}/"
    regex(/href=["']okular-master-(\d+)-macos-clang-#{arch}\.dmg["' >]/i)
  end

  depends_on macos: ">= :monterey"

  app "okular.app", target: "Okular.app"

  # Documentation: https://docs.brew.sh/Cask-Cookbook#stanza-zap
  zap trash: ""
end
