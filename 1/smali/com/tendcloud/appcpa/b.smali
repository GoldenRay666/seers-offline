.class Lcom/tendcloud/appcpa/b;
.super Lcom/tendcloud/appcpa/d;


# instance fields
.field final synthetic b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

.field private d:Ljava/util/Map;


# direct methods
.method public constructor <init>(Lcom/tendcloud/appcpa/TalkingDataAppCpa;Ljava/lang/String;Ljava/util/Map;)V
    .locals 0

    iput-object p1, p0, Lcom/tendcloud/appcpa/b;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-direct {p0, p1, p2}, Lcom/tendcloud/appcpa/d;-><init>(Lcom/tendcloud/appcpa/TalkingDataAppCpa;Ljava/lang/String;)V

    iput-object p3, p0, Lcom/tendcloud/appcpa/b;->d:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public b()V
    .locals 2

    iget-object v0, p0, Lcom/tendcloud/appcpa/b;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v0}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Lcom/tendcloud/appcpa/k;

    move-result-object v0

    iget-object v1, p0, Lcom/tendcloud/appcpa/b;->d:Ljava/util/Map;

    invoke-virtual {v0, v1}, Lcom/tendcloud/appcpa/k;->a(Ljava/util/Map;)V

    return-void
.end method
