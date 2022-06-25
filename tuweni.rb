class Tuweni < Formula
  desc "apache tuweni ethereum client"
  homepage "https://github.com/apache/incubator-tuweni"
  url "https://downloads.apache.org/incubator/tuweni/2.2.0-incubating/tuweni-bin-2.2.0-incubating.zip"
  # update with: ./updateTuweni.sh <new-version>
  sha256 "05a0f44672862b5ba1dc0b4515601b4c047e807d1823ba4a26d7131079e65506"

  depends_on "openjdk" => "11+"

  def install
    prefix.install "lib"
    bin.install "bin/tuweni"
    bin.install "bin/jsonrpc"
    bin.install "bin/eth-faucet"
  end

  test do
    system "#{bin}/tuweni" "--help"
  end
end
