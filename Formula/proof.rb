class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260810064915"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260810064915/proof_0.1.0-main.20260810064915_darwin_arm64.tar.gz"
      sha256 "3c1fd03db24b5f5deb5be18f219c4f95847a27016f968304eb52455cbe49ed71"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260810064915/proof_0.1.0-main.20260810064915_darwin_amd64.tar.gz"
      sha256 "fe96bd6d0dd096cf69966a61b674cdc0635043d6466566af102be7a7423a82b8"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260810064915/proof_0.1.0-main.20260810064915_linux_arm64.tar.gz"
      sha256 "c322f4eccc26b43698d7a3a781c27edd033bd77d4bf7808e3f6f003e2134c78c"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260810064915/proof_0.1.0-main.20260810064915_linux_amd64.tar.gz"
      sha256 "8a55c73bc0953b8e37f8712df3d3fe62dd8eac61e4181283d1815a2032121e57"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260810064915", output
  end
end
