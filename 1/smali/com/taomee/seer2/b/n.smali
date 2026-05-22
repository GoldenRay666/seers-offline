.class Lcom/taomee/seer2/b/n;
.super Ljava/lang/Thread;


# instance fields
.field final synthetic a:Lcom/taomee/seer2/b/m;


# direct methods
.method constructor <init>(Lcom/taomee/seer2/b/m;)V
    .locals 0

    iput-object p1, p0, Lcom/taomee/seer2/b/n;->a:Lcom/taomee/seer2/b/m;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    invoke-static {}, Lcom/taomee/seer2/b/j;->b()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/taomee/seer2/b/j;->d(Landroid/content/Context;)V

    invoke-static {}, Lcom/taomee/seer2/b/j;->b()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/taomee/seer2/b/j;->c(Landroid/content/Context;)V

    return-void
.end method
