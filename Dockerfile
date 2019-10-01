FROM mcr.microsoft.com/dotnet/core/sdk:3.0 AS builder

# INSTALL PRE REQS
RUN dotnet tool install --global Cake.Tool --version 0.35.0 \
    && dotnet tool install --global dotnet-sonarscanner --version 4.7.1 \
    && dotnet tool install --global coverlet.console --version 1.6.0 \
    && apt-get update -yq \
    && apt-get install curl gnupg -yq \
    && curl -sL https://deb.nodesource.com/setup_10.x | bash \
    && apt-get install nodejs -yq \
    && apt-get install default-jre -yq

ENV PATH="${PATH}:/root/.dotnet/tools"
