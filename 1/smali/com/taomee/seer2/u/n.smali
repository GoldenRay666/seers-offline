.class Lcom/taomee/seer2/u/n;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/taomee/seer2/u/d/q;


# instance fields
.field final synthetic a:Lcom/taomee/seer2/u/l;


# direct methods
.method constructor <init>(Lcom/taomee/seer2/u/l;)V
    .locals 0

    iput-object p1, p0, Lcom/taomee/seer2/u/n;->a:Lcom/taomee/seer2/u/l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    iget-object v0, p0, Lcom/taomee/seer2/u/n;->a:Lcom/taomee/seer2/u/l;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/taomee/seer2/u/l;->a(Lcom/taomee/seer2/u/l;Z)Z

    iget-object v0, p0, Lcom/taomee/seer2/u/n;->a:Lcom/taomee/seer2/u/l;

    invoke-static {v0}, Lcom/taomee/seer2/u/l;->a(Lcom/taomee/seer2/u/l;)Landroid/os/CountDownTimer;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/taomee/seer2/u/n;->a:Lcom/taomee/seer2/u/l;

    invoke-static {v0}, Lcom/taomee/seer2/u/l;->a(Lcom/taomee/seer2/u/l;)Landroid/os/CountDownTimer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->cancel()V

    :cond_0
    iget-object v0, p0, Lcom/taomee/seer2/u/n;->a:Lcom/taomee/seer2/u/l;

    invoke-static {v0}, Lcom/taomee/seer2/u/l;->b(Lcom/taomee/seer2/u/l;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/taomee/seer2/u/e;->a(Landroid/content/Context;)Lcom/taomee/seer2/u/e;

    move-result-object v0

    invoke-virtual {v0}, Lcom/taomee/seer2/u/e;->a()V

    return-void
.end method
