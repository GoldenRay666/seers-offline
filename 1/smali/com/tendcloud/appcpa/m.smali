.class Lcom/tendcloud/appcpa/m;
.super Lcom/tendcloud/appcpa/d;


# instance fields
.field final synthetic b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;


# direct methods
.method constructor <init>(Lcom/tendcloud/appcpa/TalkingDataAppCpa;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/tendcloud/appcpa/m;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-direct {p0, p1, p2}, Lcom/tendcloud/appcpa/d;-><init>(Lcom/tendcloud/appcpa/TalkingDataAppCpa;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public b()V
    .locals 1

    iget-object v0, p0, Lcom/tendcloud/appcpa/m;->b:Lcom/tendcloud/appcpa/TalkingDataAppCpa;

    invoke-static {v0}, Lcom/tendcloud/appcpa/TalkingDataAppCpa;->a(Lcom/tendcloud/appcpa/TalkingDataAppCpa;)Lcom/tendcloud/appcpa/k;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tendcloud/appcpa/k;->f()V

    return-void
.end method
