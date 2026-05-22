.class Lcom/taomee/seer2/u/v;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/taomee/seer2/u/q;


# direct methods
.method constructor <init>(Lcom/taomee/seer2/u/q;)V
    .locals 0

    iput-object p1, p0, Lcom/taomee/seer2/u/v;->a:Lcom/taomee/seer2/u/q;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/taomee/seer2/u/v;->a:Lcom/taomee/seer2/u/q;

    invoke-static {v0}, Lcom/taomee/seer2/u/q;->b(Lcom/taomee/seer2/u/q;)Lcom/taomee/seer2/u/b/f;

    move-result-object v0

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/taomee/seer2/u/b/f;->u:Z

    iget-object v0, p0, Lcom/taomee/seer2/u/v;->a:Lcom/taomee/seer2/u/q;

    iget-object v0, v0, Lcom/taomee/seer2/u/q;->a:Lcom/taomee/seer2/u/d/a;

    sget-object v1, Lcom/taomee/seer2/u/e/b;->ag:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/taomee/seer2/u/d/a;->h(Ljava/lang/String;)V

    return-void
.end method
