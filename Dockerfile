FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env
ADD . /src
WORKDIR /src
RUN dotnet build "dotnetAPI1/dotnetAPI1.csproj" -c Release -o dotnetAPI1/bin/Release/netcoreapp3.1

# Build runtime image
#FROM microsoft/dotnet:aspnetcore-runtime
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1

WORKDIR /src

COPY --from=build-env /src/dotnetAPI1/bin/Release/netcoreapp3.1 ./dotnetAPI1/bin/Release/netcoreapp3.1

COPY --from=build-env /src/Data ./Data

RUN ls -lrt /src

ENTRYPOINT ["dotnet", "dotnetAPI1/bin/Release/netcoreapp3.1/dotnetAPI1.dll"]
