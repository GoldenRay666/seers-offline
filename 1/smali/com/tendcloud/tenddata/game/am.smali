.class public Lcom/tendcloud/tenddata/game/am;
.super Lcom/tendcloud/tenddata/game/aq;


# instance fields
.field private a:Ljava/lang/String;

.field private b:Ljava/lang/String;

.field private c:J

.field private d:J

.field private f:I

.field private g:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/tendcloud/tenddata/TDGAAccount;JJ)V
    .locals 1

    const-string v0, "G4"

    invoke-direct {p0, v0}, Lcom/tendcloud/tenddata/game/aq;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/tendcloud/tenddata/game/am;->a:Ljava/lang/String;

    invoke-virtual {p2}, Lcom/tendcloud/tenddata/TDGAAccount;->getAccountId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/am;->b:Ljava/lang/String;

    invoke-virtual {p2}, Lcom/tendcloud/tenddata/TDGAAccount;->getLevel()I

    move-result v0

    iput v0, p0, Lcom/tendcloud/tenddata/game/am;->f:I

    invoke-virtual {p2}, Lcom/tendcloud/tenddata/TDGAAccount;->getGameServer()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/am;->g:Ljava/lang/String;

    iput-wide p3, p0, Lcom/tendcloud/tenddata/game/am;->c:J

    iput-wide p5, p0, Lcom/tendcloud/tenddata/game/am;->d:J

    return-void
.end method


# virtual methods
.method protected a()V
    .locals 6

    const-string v0, "gameSessionID"

    iget-object v1, p0, Lcom/tendcloud/tenddata/game/am;->a:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lcom/tendcloud/tenddata/game/am;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "userID"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/am;->b:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "level"

    iget v2, p0, Lcom/tendcloud/tenddata/game/am;->f:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "gameServer"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/am;->g:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "gameSessionStart"

    iget-wide v2, p0, Lcom/tendcloud/tenddata/game/am;->c:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "duration"

    iget-wide v2, p0, Lcom/tendcloud/tenddata/game/am;->d:J

    const-wide/16 v4, 0x3e8

    div-long/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    return-void
.end method
