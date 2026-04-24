class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260424131905"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260424131905/proof_0.1.0-main.20260424131905_darwin_arm64.tar.gz"
      sha256 "a4915462afd5b9ad573ceeac3180dcb5b9fc38c0918df5952cef782ad5a14338"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260424131905/proof_0.1.0-main.20260424131905_darwin_amd64.tar.gz"
      sha256 "02a2cfa2366b66a4c92bf4829f7313e2e5420e8f08814d072de3b0159e9e8068"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260424131905/proof_0.1.0-main.20260424131905_linux_arm64.tar.gz"
      sha256 "6152927ce223b944f0126e20dfefd0d35db05f6fbda185e7e15ef1f350e43341"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260424131905/proof_0.1.0-main.20260424131905_linux_amd64.tar.gz"
      sha256 "6b3bdcf9af5894844e2599d9d94233ddd463c19df4e262df92d0e041e879a5e3"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260424131905", output
  end
end
