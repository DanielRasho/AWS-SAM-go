FROM public.ecr.aws/docker/library/golang:1.19 as build-image
ARG ENTRY_POINT
WORKDIR /src
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN go build -tags lambda.norpc -o lambda-handler ${ENTRY_POINT}
FROM public.ecr.aws/lambda/provided:al2023
COPY --from=build-image /src/lambda-handler .
ENTRYPOINT ./lambda-handler