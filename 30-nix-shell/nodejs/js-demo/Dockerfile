# Dockerfile

FROM nixos/nix:latest

# for build
# > docker build -t js-demo .

COPY . /app
WORKDIR /app

RUN nix-env -iA cachix -f https://cachix.org/api/v1/install
RUN cachix use nix-community
RUN nix-build && cp -r result/* /app

# for run
# > docker run -dit -p 3000:3000 js-demo

RUN nix-env -iA nixpkgs.nodejs-18_x

EXPOSE 3000
CMD [ "node", "index.js" ]

