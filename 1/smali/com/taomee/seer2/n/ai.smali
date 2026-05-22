.class Lcom/taomee/seer2/n/ai;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/taomee/seer2/n/ah;


# direct methods
.method constructor <init>(Lcom/taomee/seer2/n/ah;)V
    .locals 0

    iput-object p1, p0, Lcom/taomee/seer2/n/ai;->a:Lcom/taomee/seer2/n/ah;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/taomee/seer2/n/ai;->a:Lcom/taomee/seer2/n/ah;

    iget-object v0, v0, Lcom/taomee/seer2/n/ah;->b:Lcom/taomee/seer2/n/ag;

    iget-object v0, v0, Lcom/taomee/seer2/n/ag;->a:Lcom/taomee/seer2/n/af;

    invoke-static {v0}, Lcom/taomee/seer2/n/af;->a(Lcom/taomee/seer2/n/af;)Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/taomee/seer2/n/ai;->a:Lcom/taomee/seer2/n/ah;

    iget-object v1, v1, Lcom/taomee/seer2/n/ah;->a:Lcom/taomee/seer2/n/am;

    invoke-static {v0, v1}, Lcom/taomee/seer2/n/af;->a(Landroid/content/Context;Lcom/taomee/seer2/n/am;)V

    return-void
.end method
