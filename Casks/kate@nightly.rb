cask "kate@nightly" do
  arch arm: "arm64"

  version "10324"
  sha256 "8bea8ffc2b23774e778940919fc1e62a747eb9a70bfb5dbb41f4de463e5991df"

  url "https://cdn.kde.org/ci-builds/utilities/kate/master/macos-#{arch}/kate-master-#{version}-macos-clang-#{arch}.dmg",
      verified: "cdn.kde.org/ci-builds/utilities/kate/master/"
  name "Kate"
  desc "Get an Edge in Editing"
  homepage "https://kate-editor.org/"

  livecheck do
    url "https://cdn.kde.org/ci-builds/utilities/cate/master/macos-#{arch}/"
    regex(/href=["']kate-master-(\d+)-macos-clang-#{arch}\.dmg["' >]/i)
  end

  depends_on macos: ">= :monterey"

  app "kate.app", target: "Kate.app"

  zap trash: ""
end
