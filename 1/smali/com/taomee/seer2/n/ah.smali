.class Lcom/taomee/seer2/n/ah;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/taomee/seer2/n/b/c;


# instance fields
.field final synthetic a:Lcom/taomee/seer2/n/am;

.field final synthetic b:Lcom/taomee/seer2/n/ag;


# direct methods
.method constructor <init>(Lcom/taomee/seer2/n/ag;Lcom/taomee/seer2/n/am;)V
    .locals 0

    iput-object p1, p0, Lcom/taomee/seer2/n/ah;->b:Lcom/taomee/seer2/n/ag;

    iput-object p2, p0, Lcom/taomee/seer2/n/ah;->a:Lcom/taomee/seer2/n/am;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lcom/taomee/seer2/n/b/h;I)V
    .locals 2

    const/4 v0, 0x4

    if-eq p2, v0, :cond_0

    const/4 v0, 0x5

    if-ne p2, v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/taomee/seer2/n/ah;->b:Lcom/taomee/seer2/n/ag;

    new-instance v1, Lcom/taomee/seer2/n/ai;

    invoke-direct {v1, p0}, Lcom/taomee/seer2/n/ai;-><init>(Lcom/taomee/seer2/n/ah;)V

    invoke-virtual {v0, v1}, Lcom/taomee/seer2/n/ag;->post(Ljava/lang/Runnable;)Z

    iget-object v0, p0, Lcom/taomee/seer2/n/ah;->a:Lcom/taomee/seer2/n/am;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, v0, Lcom/taomee/seer2/n/am;->l:Ljava/lang/Integer;

    iget-object v0, p0, Lcom/taomee/seer2/n/ah;->b:Lcom/taomee/seer2/n/ag;

    iget-object v0, v0, Lcom/taomee/seer2/n/ag;->a:Lcom/taomee/seer2/n/af;

    invoke-static {v0}, Lcom/taomee/seer2/n/af;->a(Lcom/taomee/seer2/n/af;)Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/taomee/seer2/n/ah;->a:Lcom/taomee/seer2/n/am;

    invoke-static {v0, v1}, Lcom/taomee/seer2/n/ba;->b(Landroid/content/Context;Lcom/taomee/seer2/n/am;)Z

    invoke-static {}, Lcom/taomee/seer2/n/an;->a()V

    :cond_1
    return-void
.end method

.method public a(Lcom/taomee/seer2/n/b/h;J)V
    .locals 0

    return-void
.end method
