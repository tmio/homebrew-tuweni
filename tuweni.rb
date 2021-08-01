class Tuweni < Formula
  desc "apache tuweni ethereum client"
  homepage "https://github.com/apache/incubator-tuweni"
  url "https://downloads.apache.org/incubator/tuweni/2.0.0-incubating/tuweni-bin-2.0.0-incubating.zip"
  # update with: ./updateTuweni.sh <new-version>
  sha256 "a11f19509e14811e97065c283adeeaf171b6b5b79690403ce5e147b78b534a55"

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
