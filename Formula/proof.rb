class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260814133028"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260814133028/proof_0.1.0-main.20260814133028_darwin_arm64.tar.gz"
      sha256 "df3b8b2a466d75a770e5719e8475ec27b70649b66d81827546513d7df39cce5d"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260814133028/proof_0.1.0-main.20260814133028_darwin_amd64.tar.gz"
      sha256 "1b40edb88622cb37d23f901343892a37a56aa56184be6c656939c5b52519017b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260814133028/proof_0.1.0-main.20260814133028_linux_arm64.tar.gz"
      sha256 "32a9f919c0a92e6a2baeedf459f3a7d552a61a66fa0c199dbf03776885250f7d"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260814133028/proof_0.1.0-main.20260814133028_linux_amd64.tar.gz"
      sha256 "0f3526fc0a7c9c60cbfec606da0933528ddb7897da7482250fdf7dcf9be9d0b4"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260814133028", output
  end
end
