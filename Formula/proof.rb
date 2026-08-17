class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260817083346"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817083346/proof_0.1.0-main.20260817083346_darwin_arm64.tar.gz"
      sha256 "6cabd96be1d043fe15cac7c10e16386c2631de89a00866abcc19941cc637bf8f"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817083346/proof_0.1.0-main.20260817083346_darwin_amd64.tar.gz"
      sha256 "e4fe78a63ee9727de690f29c0b17ef5cd77b000f99a00f7e5f683f965d10dd3b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817083346/proof_0.1.0-main.20260817083346_linux_arm64.tar.gz"
      sha256 "71673f744aadead0582af0290f16848a7c70b700fcfe24e73e7b6cce563a899f"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817083346/proof_0.1.0-main.20260817083346_linux_amd64.tar.gz"
      sha256 "11024679c6d8b0841ed05b3dab3ca9f9edf3a437822f58495e589bc063e95592"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260817083346", output
  end
end
