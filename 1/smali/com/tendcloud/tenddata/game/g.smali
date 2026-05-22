.class final Lcom/tendcloud/tenddata/game/g;
.super Ljava/lang/Object;

# interfaces
.implements Lorg/apache/http/HttpRequestInterceptor;


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public process(Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)V
    .locals 2

    const-string v0, "Connection"

    invoke-interface {p1, v0}, Lorg/apache/http/HttpRequest;->removeHeaders(Ljava/lang/String;)V

    const-string v0, "Host"

    const-string v1, "gaandroid.talkingdata.net"

    invoke-interface {p1, v0, v1}, Lorg/apache/http/HttpRequest;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
