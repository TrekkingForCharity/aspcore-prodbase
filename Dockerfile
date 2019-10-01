FROM mcr.microsoft.com/dotnet/core/sdk:3.0-alpine AS builder

# INSTALL PRE REQS
RUN dotnet tool install -g Cake.Tool \
    && dotnet tool install -g dotnet-sonarscanner \
    && dotnet tool install -g coverlet.console \
    && apt-get update -yq \
    && apt-get install curl gnupg -yq \
    && curl -sL https://deb.nodesource.com/setup_10.x | bash \
    && apt-get install nodejs -yq \
    && apt-get install default-jre -yq

ENV PATH="${PATH}:/root/.dotnet/tools"
