class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260803144711"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260803144711/proof_0.1.0-main.20260803144711_darwin_arm64.tar.gz"
      sha256 "65e4512e7994254b6340ba94863202f3d7eb618d16a8c72e9afcc624dee07521"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260803144711/proof_0.1.0-main.20260803144711_darwin_amd64.tar.gz"
      sha256 "45b7c37c39479fc92061b9038c75047c65d8eca14e61188cbcfd18fe3bfd9500"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260803144711/proof_0.1.0-main.20260803144711_linux_arm64.tar.gz"
      sha256 "5183038382f60cd08c21465afe7036f46e852fd928c1e26b4dc9e641c9b4d750"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260803144711/proof_0.1.0-main.20260803144711_linux_amd64.tar.gz"
      sha256 "190f09aa250691aabd4b5068f6d7105f835150473573ade72d8bf0f4d4d6cf20"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260803144711", output
  end
end
