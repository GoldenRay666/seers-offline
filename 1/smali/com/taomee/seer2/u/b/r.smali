.class Lcom/taomee/seer2/u/b/r;
.super Ljava/lang/Thread;


# instance fields
.field final synthetic a:Landroid/content/Context;

.field final synthetic b:Lcom/taomee/seer2/u/b/q;


# direct methods
.method constructor <init>(Lcom/taomee/seer2/u/b/q;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/taomee/seer2/u/b/r;->b:Lcom/taomee/seer2/u/b/q;

    iput-object p2, p0, Lcom/taomee/seer2/u/b/r;->a:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    invoke-super {p0}, Ljava/lang/Thread;->run()V

    iget-object v0, p0, Lcom/taomee/seer2/u/b/r;->a:Landroid/content/Context;

    invoke-static {v0}, Lcom/taomee/seer2/u/b/c;->a(Landroid/content/Context;)Lcom/taomee/seer2/u/b/c;

    move-result-object v0

    iget-object v1, p0, Lcom/taomee/seer2/u/b/r;->a:Landroid/content/Context;

    invoke-static {v1}, Lcom/taomee/seer2/u/e/i;->i(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/taomee/seer2/u/b/c;->b(Ljava/lang/String;)Lcom/taomee/seer2/u/b/i;

    return-void
.end method
