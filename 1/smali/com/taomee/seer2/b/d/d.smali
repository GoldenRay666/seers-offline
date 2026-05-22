.class Lcom/taomee/seer2/b/d/d;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Landroid/content/Context;

.field final synthetic b:Lcom/taomee/seer2/b/d/c;


# direct methods
.method constructor <init>(Lcom/taomee/seer2/b/d/c;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/taomee/seer2/b/d/d;->b:Lcom/taomee/seer2/b/d/c;

    iput-object p2, p0, Lcom/taomee/seer2/b/d/d;->a:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    sget-object v0, Lcom/taomee/seer2/b/c/f;->b:Ljava/util/List;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/taomee/seer2/b/d/d;->a:Landroid/content/Context;

    invoke-static {v0}, Lcom/taomee/seer2/b/c/f;->a(Landroid/content/Context;)Lcom/taomee/seer2/b/c/f;

    :cond_0
    return-void
.end method
