class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260419165638"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260419165638/proof_0.1.0-main.20260419165638_darwin_arm64.tar.gz"
      sha256 "82af8e6a7c0a7fb88f465f7ab824cf1b434e9818fea3fd48d210fc792dacb024"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260419165638/proof_0.1.0-main.20260419165638_darwin_amd64.tar.gz"
      sha256 "a5561dc1514f0c82a56879e267ba5a285296e115b501fc32743c061b9cbf319e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260419165638/proof_0.1.0-main.20260419165638_linux_arm64.tar.gz"
      sha256 "1a73277e2138f30fde877059c79afc701304f1c1244e028d2d2df4a7795675ab"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260419165638/proof_0.1.0-main.20260419165638_linux_amd64.tar.gz"
      sha256 "5436a60ce770006fe9ae7100d01712334cf8569a1ea5687881f5b82bb7cdb80c"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260419165638", output
  end
end
