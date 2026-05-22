.class public Lcom/tendcloud/tenddata/game/v;
.super Lcom/tendcloud/tenddata/game/aq;


# instance fields
.field private a:Ljava/lang/String;

.field private b:Ljava/lang/String;

.field private c:I

.field private d:Ljava/lang/String;

.field private f:D

.field private g:Ljava/lang/String;

.field private h:I

.field private i:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/tendcloud/tenddata/TDGAAccount;Ljava/lang/String;DLjava/lang/String;I)V
    .locals 1

    const-string v0, "G10"

    invoke-direct {p0, v0}, Lcom/tendcloud/tenddata/game/aq;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/tendcloud/tenddata/game/v;->a:Ljava/lang/String;

    invoke-virtual {p2}, Lcom/tendcloud/tenddata/TDGAAccount;->getAccountId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/v;->b:Ljava/lang/String;

    invoke-virtual {p2}, Lcom/tendcloud/tenddata/TDGAAccount;->getLevel()I

    move-result v0

    iput v0, p0, Lcom/tendcloud/tenddata/game/v;->c:I

    invoke-virtual {p2}, Lcom/tendcloud/tenddata/TDGAAccount;->getGameServer()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/v;->d:Ljava/lang/String;

    iput-object p3, p0, Lcom/tendcloud/tenddata/game/v;->i:Ljava/lang/String;

    iput-wide p4, p0, Lcom/tendcloud/tenddata/game/v;->f:D

    iput-object p6, p0, Lcom/tendcloud/tenddata/game/v;->g:Ljava/lang/String;

    iput p7, p0, Lcom/tendcloud/tenddata/game/v;->h:I

    return-void
.end method


# virtual methods
.method protected a()V
    .locals 4

    const-string v0, "gameSessionID"

    iget-object v1, p0, Lcom/tendcloud/tenddata/game/v;->a:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lcom/tendcloud/tenddata/game/v;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "userID"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/v;->b:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "level"

    iget v2, p0, Lcom/tendcloud/tenddata/game/v;->c:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "gameServer"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/v;->d:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "mission"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/v;->i:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "virtualCurrencyAmount"

    iget-wide v2, p0, Lcom/tendcloud/tenddata/game/v;->f:D

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "itemid"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/v;->g:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "itemnumber"

    iget v2, p0, Lcom/tendcloud/tenddata/game/v;->h:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    return-void
.end method
