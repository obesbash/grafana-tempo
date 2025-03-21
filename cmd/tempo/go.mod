module github.com/grafana/tempo

go 1.24.1

require (
	github.com/drone/envsubst v1.0.3
	github.com/go-kit/log v0.2.1
	github.com/grafana/dskit v0.0.0-20250317084829-9cdd36a91f10
	github.com/opentracing/opentracing-go v1.2.0
	github.com/prometheus/client_golang v1.21.1
	github.com/prometheus/common v0.62.0
	go.opentelemetry.io/contrib/exporters/autoexport v0.59.0
	go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc v1.35.0
	go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracehttp v1.35.0
	go.opentelemetry.io/otel/bridge/opencensus v1.35.0
	go.opentelemetry.io/otel/bridge/opentracing v1.35.0
	go.opentelemetry.io/otel/exporters/jaeger v1.17.0
	go.opentelemetry.io/otel/metric v1.35.0
	go.opentelemetry.io/otel/sdk v1.35.0
	go.opentelemetry.io/otel/trace v1.35.0
	google.golang.org/grpc v1.71.0
	gopkg.in/yaml.v2 v2.4.0
	gopkg.in/yaml.v3 v3.0.1
)

replace (
	github.com/bradfitz/gomemcache => github.com/themihai/gomemcache v0.0.0-20180902122335-24332e2d58ab
	k8s.io/api => k8s.io/api v0.25.0
	k8s.io/client-go => k8s.io/client-go v0.25.0
)

// Replace memberlist with our fork which includes some fixes that haven't been
// merged upstream yet:
// - https://github.com/hashicorp/memberlist/pull/260
// - https://github.com/grafana/memberlist/pull/3
replace github.com/hashicorp/memberlist => github.com/grafana/memberlist v0.3.1-0.20220708130638-bd88e10a3d91
