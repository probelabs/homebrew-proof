class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260531185218"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260531185218/proof_0.1.0-main.20260531185218_darwin_arm64.tar.gz"
      sha256 "aaf66d5c115089ad2362ffa66251f247aecf51c2c213d18c48bc464de6eaf7b9"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260531185218/proof_0.1.0-main.20260531185218_darwin_amd64.tar.gz"
      sha256 "315827dfcef10e38d4a9046ce5967a7a49057a2ff69f0733ef4ea7983efc9857"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260531185218/proof_0.1.0-main.20260531185218_linux_arm64.tar.gz"
      sha256 "5a498656719d5c511ae9f32021ca138ba18a29a3e765fbe4d40af6448a31b26b"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260531185218/proof_0.1.0-main.20260531185218_linux_amd64.tar.gz"
      sha256 "b3c0be241375b7c3834c6f10c358c884c73e228afa994693576ba9c4fc632a01"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260531185218", output
  end
end
