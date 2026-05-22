.class Lcom/taomee/seer2/b/d/h;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/taomee/seer2/b/d/f;


# direct methods
.method constructor <init>(Lcom/taomee/seer2/b/d/f;)V
    .locals 0

    iput-object p1, p0, Lcom/taomee/seer2/b/d/h;->a:Lcom/taomee/seer2/b/d/f;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/taomee/seer2/b/d/h;->a:Lcom/taomee/seer2/b/d/f;

    iget-object v0, v0, Lcom/taomee/seer2/b/d/f;->c:Lcom/taomee/seer2/b/d/c;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/taomee/seer2/b/d/c;->b(Lcom/taomee/seer2/b/d/c;Z)Z

    return-void
.end method
