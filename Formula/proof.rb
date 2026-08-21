class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260821202015"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260821202015/proof_0.1.0-main.20260821202015_darwin_arm64.tar.gz"
      sha256 "d637c214101088f89797cf3455504712ae39c49f8084f5c8430ed1fa2d59868b"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260821202015/proof_0.1.0-main.20260821202015_darwin_amd64.tar.gz"
      sha256 "a1d8ac31ad830ce76ad84461ff7a73b06013e31518e1d962ab6dd09de9b0fd16"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260821202015/proof_0.1.0-main.20260821202015_linux_arm64.tar.gz"
      sha256 "b2153bd903823e23d9e0fb469b4d1c725d50b84ac024d35fb9c60eed95fa0b8a"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260821202015/proof_0.1.0-main.20260821202015_linux_amd64.tar.gz"
      sha256 "6038f0d7dce59205c37cc691439e6aa5729b26f82bac5a05aa222391b6f61ec3"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260821202015", output
  end
end
