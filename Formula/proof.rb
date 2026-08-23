class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260823195324"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260823195324/proof_0.1.0-main.20260823195324_darwin_arm64.tar.gz"
      sha256 "cb3e4b602ac93a539211d50da30524c37af0b30770d7ea46fd9b6d9436701422"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260823195324/proof_0.1.0-main.20260823195324_darwin_amd64.tar.gz"
      sha256 "17d04ecb44384fbf6559f2bdce0b7417a09067d2373dfd45e854c1024e6bd578"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260823195324/proof_0.1.0-main.20260823195324_linux_arm64.tar.gz"
      sha256 "c51bb5eaa0878c9c2a4e77c51773bd3b77aa0bf324be37437928cbb550bc994e"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260823195324/proof_0.1.0-main.20260823195324_linux_amd64.tar.gz"
      sha256 "1da4c882dcc6bde974941f8df2005303ba6de38e076420652ee75ba1a4ac2f49"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260823195324", output
  end
end
