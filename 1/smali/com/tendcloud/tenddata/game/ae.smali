.class public Lcom/tendcloud/tenddata/game/ae;
.super Lcom/tendcloud/tenddata/game/aq;


# instance fields
.field private a:Ljava/lang/String;

.field private b:Ljava/lang/String;

.field private c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const-string v0, "G14"

    invoke-direct {p0, v0}, Lcom/tendcloud/tenddata/game/aq;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/tendcloud/tenddata/game/ae;->a:Ljava/lang/String;

    iput-object p2, p0, Lcom/tendcloud/tenddata/game/ae;->b:Ljava/lang/String;

    iput-object p3, p0, Lcom/tendcloud/tenddata/game/ae;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected a()V
    .locals 3

    const-string v0, "aas"

    iget-object v1, p0, Lcom/tendcloud/tenddata/game/ae;->a:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lcom/tendcloud/tenddata/game/ae;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "ruas"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/ae;->b:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    move-result-object v0

    const-string v1, "ras"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/ae;->c:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/tendcloud/tenddata/game/aq;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;

    return-void
.end method
