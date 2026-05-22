.class public Lcom/tendcloud/tenddata/game/q;
.super Lcom/tendcloud/tenddata/game/aq;


# instance fields
.field private a:Ljava/lang/String;

.field private b:Ljava/lang/String;

.field private c:I

.field private d:I

.field private f:Ljava/lang/String;

.field private g:I

.field private h:Ljava/lang/String;

.field private i:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/tendcloud/tenddata/TDGAAccount;)V
    .locals 1

    const-string v0, "G7"

    invoke-direct {p0, v0}, Lcom/tendcloud/tenddata/game/aq;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/tendcloud/tenddata/game/q;->a:Ljava/lang/String;

    invoke-virtual {p2}, Lcom/tendcloud/tenddata/TDGAAccount;->getAccountId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/q;->b:Ljava/lang/String;

    invoke-virtual {p2}, Lcom/tendcloud/tenddata/TDGAAccount;->getLevel()I

    move-result v0

    iput v0, p0, Lcom/tendcloud/tenddata/game/q;->c:I

    invoke-virtual {p2}, Lcom/tendcloud/tenddata/TDGAAccount;->getGender()Lcom/tendcloud/tenddata/TDGAAccount$Gender;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tendcloud/tenddata/TDGAAccount$Gender;->index()I

    move-result v0

    iput v0, p0, Lcom/tendcloud/tenddata/game/q;->d:I

    invoke-virtual {p2}, Lcom/tendcloud/tenddata/TDGAAccount;->getAccountType()Lcom/tendcloud/tenddata/TDGAAccount$AccountType;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tendcloud/tenddata/TDGAAccount$AccountType;->index()I

    move-result v0

    iput v0, p0, Lcom/tendcloud/tenddata/game/q;->g:I

    invoke-virtual {p2}, Lcom/tendcloud/tenddata/TDGAAccount;->getGameServer()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/q;->h:Ljava/lang/String;

    invoke-virtual {p2}, Lcom/tendcloud/tenddata/TDGAAccount;->getAccountName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/q;->f:Ljava/lang/String;

    invoke-virtual {p2}, Lcom/tendcloud/tenddata/TDGAAccount;->getAge()I

    move-result v0

    iput v0, p0, Lcom/tendcloud/tenddata/game/q;->i:I

    return-void
.end method


# virtual methods
.method protected a()V
    .locals 3

    const-string v0, "gameSessionID"

    iget-object v1, p0, Lcom/tendcloud/tenddata/game/q;->a:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lcom/tendcloud/tenddata/game/q;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "userID"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/q;->b:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "level"

    iget v2, p0, Lcom/tendcloud/tenddata/game/q;->c:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "sex"

    iget v2, p0, Lcom/tendcloud/tenddata/game/q;->d:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "account"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/q;->f:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "accountType"

    iget v2, p0, Lcom/tendcloud/tenddata/game/q;->g:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "gameServer"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/q;->h:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "age"

    iget v2, p0, Lcom/tendcloud/tenddata/game/q;->i:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    return-void
.end method
