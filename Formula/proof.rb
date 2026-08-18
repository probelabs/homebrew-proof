class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260818083958"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260818083958/proof_0.1.0-main.20260818083958_darwin_arm64.tar.gz"
      sha256 "5861deae51473e58fa6509b5d57d5e19648437ca040ce369d03713effb643673"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260818083958/proof_0.1.0-main.20260818083958_darwin_amd64.tar.gz"
      sha256 "5cc85f893fb3eb7ac3cbd74e053e57f704bca67f7054c5db62876ff69ebc4e30"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260818083958/proof_0.1.0-main.20260818083958_linux_arm64.tar.gz"
      sha256 "c6e82174ccd8f5fa0e266af7578f947e4981f2e93d1303216bb6d1cee4b8b16f"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260818083958/proof_0.1.0-main.20260818083958_linux_amd64.tar.gz"
      sha256 "836c912522b6ab2c172e9a69f11e5c6384c335e7dcd1ba772505b9337206c22e"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260818083958", output
  end
end
