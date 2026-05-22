.class public Lcom/tendcloud/tenddata/game/i;
.super Lcom/tendcloud/tenddata/game/aq;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tendcloud/tenddata/game/i$a;
    }
.end annotation


# instance fields
.field private a:Ljava/lang/String;

.field private b:Ljava/lang/String;

.field private c:I

.field private d:Ljava/lang/String;

.field private f:Ljava/lang/String;

.field private g:Lcom/tendcloud/tenddata/game/i$a;

.field private h:Ljava/lang/String;

.field private i:J


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/tendcloud/tenddata/TDGAAccount;Ljava/lang/String;Ljava/lang/String;JLcom/tendcloud/tenddata/game/i$a;)V
    .locals 1

    const-string v0, "G6"

    invoke-direct {p0, v0}, Lcom/tendcloud/tenddata/game/aq;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/tendcloud/tenddata/game/i;->a:Ljava/lang/String;

    invoke-virtual {p2}, Lcom/tendcloud/tenddata/TDGAAccount;->getAccountId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/i;->b:Ljava/lang/String;

    invoke-virtual {p2}, Lcom/tendcloud/tenddata/TDGAAccount;->getLevel()I

    move-result v0

    iput v0, p0, Lcom/tendcloud/tenddata/game/i;->c:I

    invoke-virtual {p2}, Lcom/tendcloud/tenddata/TDGAAccount;->getGameServer()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/i;->f:Ljava/lang/String;

    iput-object p3, p0, Lcom/tendcloud/tenddata/game/i;->d:Ljava/lang/String;

    iput-object p4, p0, Lcom/tendcloud/tenddata/game/i;->h:Ljava/lang/String;

    iput-object p7, p0, Lcom/tendcloud/tenddata/game/i;->g:Lcom/tendcloud/tenddata/game/i$a;

    iput-wide p5, p0, Lcom/tendcloud/tenddata/game/i;->i:J

    return-void
.end method


# virtual methods
.method protected a()V
    .locals 6

    const-string v0, "gameSessionID"

    iget-object v1, p0, Lcom/tendcloud/tenddata/game/i;->a:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lcom/tendcloud/tenddata/game/i;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "userID"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/i;->b:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "level"

    iget v2, p0, Lcom/tendcloud/tenddata/game/i;->c:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "gameServer"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/i;->f:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "mission"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/i;->d:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "cause"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/i;->h:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "status"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/i;->g:Lcom/tendcloud/tenddata/game/i$a;

    invoke-static {v2}, Lcom/tendcloud/tenddata/game/i$a;->a(Lcom/tendcloud/tenddata/game/i$a;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "timeConsuming"

    iget-wide v2, p0, Lcom/tendcloud/tenddata/game/i;->i:J

    const-wide/16 v4, 0x3e8

    div-long/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    return-void
.end method
