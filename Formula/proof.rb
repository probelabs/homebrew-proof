class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260804111939"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260804111939/proof_0.1.0-main.20260804111939_darwin_arm64.tar.gz"
      sha256 "c6fbbcca435b70f6cc5c62dc6ec6ca9d9e007e64670d711bcea4207762ef4eb9"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260804111939/proof_0.1.0-main.20260804111939_darwin_amd64.tar.gz"
      sha256 "8b784193bf04637416b512423b27e041f5f16ed4fd2cfff3db97f5ecb9d994c5"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260804111939/proof_0.1.0-main.20260804111939_linux_arm64.tar.gz"
      sha256 "68143dd159427e910fa2fc2964998439c6d6f9ae366a2a01686563f6fe9ad638"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260804111939/proof_0.1.0-main.20260804111939_linux_amd64.tar.gz"
      sha256 "8141be0c9c89f8e89dcc261f87b19e0d4aee3345b62eb314b501c51344380b2e"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260804111939", output
  end
end
