.class Lcom/tendcloud/appcpa/e;
.super Lcom/tendcloud/appcpa/d;


# instance fields
.field b:Ljava/lang/String;

.field final synthetic d:Lcom/tendcloud/appcpa/TalkingDataAppCpa;


# direct methods
.method constructor <init>(Lcom/tendcloud/appcpa/TalkingDataAppCpa;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/tendcloud/appcpa/e;->d:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-direct {p0, p1, p2}, Lcom/tendcloud/appcpa/d;-><init>(Lcom/tendcloud/appcpa/TalkingDataAppCpa;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method a(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/tendcloud/appcpa/e;->b:Ljava/lang/String;

    return-void
.end method

.method public b()V
    .locals 2

    iget-object v0, p0, Lcom/tendcloud/appcpa/e;->d:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v0}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Lcom/tendcloud/appcpa/k;

    move-result-object v0

    iget-object v1, p0, Lcom/tendcloud/appcpa/e;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/tendcloud/appcpa/k;->e(Ljava/lang/String;)V

    return-void
.end method
