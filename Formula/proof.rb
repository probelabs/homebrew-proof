class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260424120923"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260424120923/proof_0.1.0-main.20260424120923_darwin_arm64.tar.gz"
      sha256 "69be6226f145791fb8828cba20172c235470925536894b4f6a8d0f5602fbafc7"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260424120923/proof_0.1.0-main.20260424120923_darwin_amd64.tar.gz"
      sha256 "f38398a7cc519193bd373afbda6da1c28e21ace35971ce95c3cc368e3da67a90"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260424120923/proof_0.1.0-main.20260424120923_linux_arm64.tar.gz"
      sha256 "f3303542d8b747c67ebc7bf8a72c93a37adac95a5db378de4ddf39686deeb33b"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260424120923/proof_0.1.0-main.20260424120923_linux_amd64.tar.gz"
      sha256 "d5d7e9646be5b08103f239ed88fa8799d6accceddff0cb0158652223b19b1769"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260424120923", output
  end
end
