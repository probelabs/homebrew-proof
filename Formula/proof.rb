class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260424180948"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260424180948/proof_0.1.0-main.20260424180948_darwin_arm64.tar.gz"
      sha256 "cf3d7f6266775960cf0f9d5bc90992b9c517bc75f04b2da9f078b2cd1c6eba1f"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260424180948/proof_0.1.0-main.20260424180948_darwin_amd64.tar.gz"
      sha256 "7ecad30af163e9794f898eb9f99f88aa3ee1193dc630c1e99188d5ee30c7d943"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260424180948/proof_0.1.0-main.20260424180948_linux_arm64.tar.gz"
      sha256 "be20f6ac6fe7939da721da769df26cb6e81f0d751d86bcce7b8af3e4ea2fbeae"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260424180948/proof_0.1.0-main.20260424180948_linux_amd64.tar.gz"
      sha256 "94ce5948d91996b60bd6bfbdb8af8d5ccb7b133bf96cfe533b8a075d2606b7a0"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260424180948", output
  end
end
