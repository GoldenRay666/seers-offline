.class Lcom/tendcloud/tenddata/game/m;
.super Lcom/tendcloud/tenddata/game/a;


# instance fields
.field private b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Lcom/tendcloud/tenddata/game/a;-><init>()V

    iput-object p1, p0, Lcom/tendcloud/tenddata/game/m;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Lcom/tendcloud/tenddata/game/m;->b:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/tendcloud/tenddata/game/m;->a(Ljava/lang/String;)V

    return-void
.end method
