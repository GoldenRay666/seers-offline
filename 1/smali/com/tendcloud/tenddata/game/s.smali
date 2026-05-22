.class public final Lcom/tendcloud/tenddata/game/s;
.super Lcom/tendcloud/tenddata/game/aq;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tendcloud/tenddata/game/s$a;
    }
.end annotation


# instance fields
.field private a:Ljava/lang/String;

.field private b:Ljava/lang/String;

.field private c:I

.field private d:Ljava/lang/String;

.field private f:Ljava/lang/String;

.field private g:Ljava/lang/String;

.field private h:D

.field private i:Ljava/lang/String;

.field private j:D

.field private k:Ljava/lang/String;

.field private l:Lcom/tendcloud/tenddata/game/s$a;

.field private m:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/tendcloud/tenddata/TDGAAccount;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;DLjava/lang/String;DLjava/lang/String;Lcom/tendcloud/tenddata/game/s$a;)V
    .locals 1

    const-string v0, "G9"

    invoke-direct {p0, v0}, Lcom/tendcloud/tenddata/game/aq;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/tendcloud/tenddata/game/s;->a:Ljava/lang/String;

    invoke-virtual {p2}, Lcom/tendcloud/tenddata/TDGAAccount;->getAccountId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/s;->b:Ljava/lang/String;

    invoke-virtual {p2}, Lcom/tendcloud/tenddata/TDGAAccount;->getLevel()I

    move-result v0

    iput v0, p0, Lcom/tendcloud/tenddata/game/s;->c:I

    invoke-virtual {p2}, Lcom/tendcloud/tenddata/TDGAAccount;->getGameServer()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/s;->d:Ljava/lang/String;

    iput-object p3, p0, Lcom/tendcloud/tenddata/game/s;->m:Ljava/lang/String;

    iput-object p4, p0, Lcom/tendcloud/tenddata/game/s;->f:Ljava/lang/String;

    iput-object p5, p0, Lcom/tendcloud/tenddata/game/s;->g:Ljava/lang/String;

    iput-wide p6, p0, Lcom/tendcloud/tenddata/game/s;->h:D

    iput-object p8, p0, Lcom/tendcloud/tenddata/game/s;->i:Ljava/lang/String;

    iput-wide p9, p0, Lcom/tendcloud/tenddata/game/s;->j:D

    iput-object p11, p0, Lcom/tendcloud/tenddata/game/s;->k:Ljava/lang/String;

    iput-object p12, p0, Lcom/tendcloud/tenddata/game/s;->l:Lcom/tendcloud/tenddata/game/s$a;

    return-void
.end method


# virtual methods
.method protected a()V
    .locals 4

    const-string v0, "gameSessionID"

    iget-object v1, p0, Lcom/tendcloud/tenddata/game/s;->a:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lcom/tendcloud/tenddata/game/s;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "userID"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/s;->b:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "level"

    iget v2, p0, Lcom/tendcloud/tenddata/game/s;->c:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "gameServer"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/s;->d:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "mission"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/s;->m:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "orderId"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/s;->f:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "iapId"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/s;->g:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "currencyAmount"

    iget-wide v2, p0, Lcom/tendcloud/tenddata/game/s;->h:D

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "virtualCurrencyAmount"

    iget-wide v2, p0, Lcom/tendcloud/tenddata/game/s;->j:D

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "currencyType"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/s;->i:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "paymentType"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/s;->k:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "status"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/s;->l:Lcom/tendcloud/tenddata/game/s$a;

    invoke-virtual {v2}, Lcom/tendcloud/tenddata/game/s$a;->a()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    return-void
.end method

.method public a(Lcom/tendcloud/tenddata/game/s$a;)V
    .locals 0

    iput-object p1, p0, Lcom/tendcloud/tenddata/game/s;->l:Lcom/tendcloud/tenddata/game/s$a;

    return-void
.end method
