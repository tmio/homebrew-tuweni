#!/usr/bin/env bash

set -euo pipefail
TEMP=`mktemp -d`

function cleanup() 
{
	rm -rf "${TEMP}"
}

trap cleanup EXIT

VERSION=${1?Must specify the tuweni version to get}

URL="https://dlcdn.apache.org/incubator/tuweni/${VERSION}-incubating/tuweni-bin-${VERSION}-incubating.zip"
echo "Downloading version ${VERSION} of tuweni from ${URL}..."
curl -o "${TEMP}/tuweni-${VERSION}.zip" -sL "${URL}"

echo "Calculating new hash..."
HASH=`shasum -a 256 ${TEMP}/tuweni-${VERSION}.zip | cut -d ' ' -f 1`

unzip -t  "${TEMP}/tuweni-${VERSION}.zip"

cat > tuweni.rb <<EOF
class Tuweni < Formula
  desc "apache tuweni ethereum client"
  homepage "https://github.com/apache/incubator-tuweni"
  url "${URL}"
  # update with: ./updateTuweni.sh <new-version>
  sha256 "${HASH}"

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
EOF

echo "New url: ${URL}"
echo "New hash: ${HASH}"
echo "Success.  Commit the changes to tuweni.rb to release."
