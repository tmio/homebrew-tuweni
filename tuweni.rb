class Tuweni < Formula
  desc "apache tuweni ethereum client"
  homepage "https://github.com/apache/incubator-tuweni"
  url "https://dlcdn.apache.org/incubator/tuweni/2.3.1-incubating/tuweni-bin-2.3.1-incubating.zip"
  # update with: ./updateTuweni.sh <new-version>
  sha256 "368e9212cbc8284dbd1b3ab9d8b7f2e937e3499bafdc6bcdd8ba0e041c82db4f"

  depends_on "openjdk" => "11+"

  def install
    prefix.install "lib"
    bin.install "bin/tuweni"
    # bin.install "bin/jsonrpc"
    bin.install "bin/eth-faucet"
  end

  test do
    system "#{bin}/tuweni" "--help"
  end
end
